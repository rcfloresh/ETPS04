//
//  drugSearch.swift
//  projectETPS04
//
//  Created by Roberto Flores on 30/11/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct drugSearch: View {
    
    @State private var medicamento = ""
    @State private var medicamentos: [String] = []
    @State private var departamentos: [String] = []
    @State private var municipios: [String] = []
    @State private var departamentoSeleccionado: String = ""
    @State private var municipioSeleccionado: String = ""
    @State private var farmaciasEncontradas: [String] = []
    @State private var otroNombre: [Farmacia] = []
    @State private var mostrarResultados = false
    
    let db = Firestore.firestore()
    
    @StateObject private var vm = SignIn_withGoogle_VM()
    @State private var userIsLoggedIn: Bool=true
    
    var body: some View {
        
        
        NavigationView{
        
            ZStack{
                bgColorStyle()
                VStack{
                    
                    
                    
                    Image(.logo)
                        .resizable()
                        .frame(width: 75, height: 75)
                        .foregroundColor(.white)
                        .shadow(color:.black
                                .opacity(0.25),
                                radius: 10,x:0, y: 20)
                        .frame(width:300, alignment: .trailing)
                    
                    
                    TextField("Medicamento:", text: $medicamento)
                                    .onChange(of: medicamento) { newValue in
                                        buscarMedicamentoInteractivo(query: newValue)
                                    }
                                    .frame(width: 300, height: 30)
                                    .disableAutocorrection(true)
                                    .padding(8)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(25)
                                    .padding(.horizontal, 60)
                                    .padding(.top, 20)

                    ScrollView {
                        LazyVStack {
                            ForEach(medicamentos, id: \.self) { medicamento in
                                Button(action: {
                                    self.medicamento = medicamento
                                }) {
                                    HStack {
                                        Text(medicamento)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        Spacer()
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    
                    Picker("Departamento", selection:
                                            $departamentoSeleccionado) {
                                                ForEach(departamentos, id: \.self) { departamento in
                                                    Text(departamento).tag(departamento)
                                                }
                                            }
                                            .frame(width: 300, height: 30)
                                            .padding(8)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(25)
                                            .padding(.horizontal, 60)
                                            .padding(.top, 20)
                                            .onAppear {obtenerDepartamentos()}
                                            .onChange(of: departamentoSeleccionado)
                                                { nuevoValor in obtenerMunicipios(
                                                    departamento: nuevoValor)
                                                                        }

                    Picker("Municipio", selection: $municipioSeleccionado) {
                        ForEach(municipios, id: \.self) { municipio in
                            Text(municipio).tag(municipio)
                        }
                    }
                    .frame(width: 300, height: 30)
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(.headline)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(25)
                        .padding(.horizontal, 60)
                        .padding(.top, 20)

                    Button(action:{
                        buscarMedicamento()
                    },
                           label : {
                        Text("Buscar medicamento".uppercased())
                            .frame(width: 300, height: 30)
                            .foregroundColor(.white)
                            .padding()
                            .background(.orange)
                            .cornerRadius(25)
                            .shadow(radius: 10)
                            .padding(.horizontal, 60)
                            .padding(.top, 7)
                            .font(.system(size:15, weight: .bold))
                    })
                    
                                        NavigationLink(destination: resultadoBusquedaView(farmacias: otroNombre), isActive: $mostrarResultados) {
                                            EmptyView()
                                        }
                }.navigationBarItems(trailing:
                                        Menu {
                                            Button(action: {
                                                vm.signOut()
                                            }) {
                                                Text("Cerrar sesión")
                                                Image(systemName: "arrowshape.turn.up.left")
                                            }
                                        } label: {
                                            Image(systemName: "line.horizontal.3")
                                                .imageScale(.large)
                                        }
                )
            }
        }
      
    }
    
    func obtenerDepartamentos() {
        db.collection("deptMuni").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error obteniendo documentos: \(err)")
            } else {
                departamentos = querySnapshot!.documents.map { $0.documentID }
                if !departamentos.isEmpty {
                    departamentoSeleccionado = departamentos[0]
                    obtenerMunicipios(departamento: departamentos[0])
                }
            }
        }
    }
    
    func obtenerMunicipios(departamento: String) {
        db.collection("deptMuni").document(departamento).getDocument { (document, err) in
            if let document = document, document.exists {
                municipios = document.data()?["municipalities"] as? [String] ?? []
            } else {
                print("Documento no existe")
            }
        }
    }
    
    func buscarMedicamento() {
        let docRef = db.collection("Medicamentos").document(medicamento)
        
        docRef.getDocument { (document, err) in
            if let document = document, document.exists {
                // Asumiendo que el documento tiene un campo 'Farmacias' que es un array
                let farmaciasDelMedicamento = document.data()?["Farmacias"] as? [String] ?? []
                
                // Filtrar las farmacias por el municipio seleccionado
                filtrarFarmaciasPorMunicipio(farmacias: farmaciasDelMedicamento)
                obtenerDatosDeFarmacias(farmacias: farmaciasDelMedicamento)
            } else if let err = err {
                print("Error buscando el medicamento: \(err)")
            } else {
                print("Medicamento no encontrado")
            }
        }
    }

    func obtenerDatosDeFarmacias(farmacias: [String]) {
        for farmacia in farmacias {
            let docRef = db.collection("Farmacias").document(farmacia)
            
            docRef.getDocument { (document, err) in
                if let document = document, document.exists {
                    let latitud = document.data()?["Latitud"] as? Double ?? 0
                    let longitud = document.data()?["Longitud"] as? Double ?? 0
                    
                    // Aquí puedes crear una nueva instancia de Farmacia y agregarla a tu array de farmacias
                    let nuevaFarmacia = Farmacia(id: farmacia, longitud: longitud, latitud: latitud)
                    self.otroNombre.append(nuevaFarmacia)
                } else if let err = err {
                    print("Error obteniendo datos de la farmacia: \(err)")
                } else {
                    print("Farmacia no encontrada")
                }
            }
        }
    }
    
    func filtrarFarmaciasPorMunicipio(farmacias: [String]) {
        // Crear un grupo de dispatch para manejar las consultas asincrónicas
        let dispatchGroup = DispatchGroup()

        // Array para almacenar las farmacias filtradas
        var farmaciasFiltradas: [String] = []

        for farmacia in farmacias {
            dispatchGroup.enter()
            db.collection("Farmacias").document(farmacia).getDocument { (document, err) in
                if let document = document, document.exists, let municipioDeLaFarmacia = document.data()?["Municipio"] as? String {
                    if municipioDeLaFarmacia == municipioSeleccionado {
                        farmaciasFiltradas.append(farmacia)
                    }
                } else if let err = err {
                    print("Error obteniendo la farmacia: \(err)")
                }
                dispatchGroup.leave()
            }
        }

        // Esperar a que todas las consultas se completen
        dispatchGroup.notify(queue: .main) {
            self.farmaciasEncontradas = farmaciasFiltradas
            self.mostrarResultados = true
        }
    }
    
    func buscarMedicamentoInteractivo(query: String) {
            let db = Firestore.firestore()
            db.collection("Medicamentos").whereField(FieldPath.documentID(), isGreaterThanOrEqualTo: query).whereField(FieldPath.documentID(), isLessThanOrEqualTo: query + "\u{f8ff}").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                medicamentos = documents.map { $0.documentID }
            }
        }
    
}
    

#Preview {
    drugSearch()
}
