//
//  Demo.swift
//  GraphQLDemo
//
//  Created by Sergey Nikolaev on 16/05/2019.
//  Copyright © 2019 Sergey Nikolaev. All rights reserved.
//

import Apollo

let client: ApolloClient = {
    let url = URL(string: "http://localhost:9000/graphql")!
    let transport = HTTPNetworkTransport(url: url)
    let store = ApolloStore(cache: InMemoryNormalizedCache())
    let client = ApolloClient(networkTransport: transport, store: store)
    
    return client
}()

func basicRequest() {
    print(String(repeating: "\n", count: 100))
    
    let query = GetBasicProductQuery(id: "1")
    
    client.fetch(query: query) { (result, error) in
        if let error = error {
            print(error)
            return
        }
        
        guard let result = result else { return }
        print(result)
        print()
        
        guard let data = result.data else { return }
        print(data)
        print()
    }
}
