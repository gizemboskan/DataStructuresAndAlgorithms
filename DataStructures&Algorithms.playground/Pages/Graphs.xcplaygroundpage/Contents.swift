////: [Previous](@previous)
//
//import Foundation
//import UIKit
//
//var greeting = "Hello, playground"
//
////: [Next](@next)
//
//enum EdgeType {
//
//    case directed
//    case undirected
//
//}
//
//struct Vertex<T>{
//
//    let data: T
//    let index: Int
//    
//}
//
//extension Vertex: Hashable where T: Hashable { }
//extension Vertex: Equatable where T: Equatable { }
//
//extension Vertex: CustomStringConvertible {
//    var description: String {
//        return "\(index): \(data)"
//    }
//}
//
//struct Edge<T> {
//    let source = Vertex<T>
//    let destination: Vertex<T>
//    let weight: Double?
//}
//
//protocol Graph {
//
//    associatedtype Element
//    func createVertex(data: Element) -> Vertex<Element>
//    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
//    func addUnDirectedEdge(between source: Vertex, and destination: Vertex<Element>, weight: Double?)
//    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
//    func edges(from source: Vertex<Element>) -> [Edge<Element>]
//    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
//}
//
//extension Graph {
//
//    // addUndirectedGraph
//    func addUnDirectedEdge(between source: Vertex<T>, and destination: Vertex<T>, weight: Double?) {
//        addUnDirectedEdge(from: source, destination: destination, weight: weight)
//    }
//    // add
//
//
//}
//
//
//class AdjacencyList<T: Hashable> : Graph{
//
//    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
//
//    init() { }
//    func createVertex(data: T) -> Vertex<T>{
//        let vertex = Vertex(data: data, index: adjacencies.count)
//        adjacencies[vertex] = []
//        return vertex
//    }
//    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
//        let edge = Edge(source: source, destination: destination, weight: weight)
//        adjacencies[source]?.append(edge)
//    }
//}
