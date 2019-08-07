//  This file was automatically generated and should not be edited.

import Apollo

public final class GetFragmentProductQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetFragmentProduct($id: ID!) {\n  product(id: $id) {\n    __typename\n    ...ProductFragment\n    suggestedProducts {\n      __typename\n      ...ProductFragment\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(ProductFragment.fragmentDefinition) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("product", arguments: ["id": GraphQLVariable("id")], type: .object(Product.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(product: Product? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
    }

    public var product: Product? {
      get {
        return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "product")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["Product"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ProductFragment.self),
        GraphQLField("suggestedProducts", type: .list(.object(SuggestedProduct.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var suggestedProducts: [SuggestedProduct?]? {
        get {
          return (resultMap["suggestedProducts"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SuggestedProduct?] in value.map { (value: ResultMap?) -> SuggestedProduct? in value.flatMap { (value: ResultMap) -> SuggestedProduct in SuggestedProduct(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [SuggestedProduct?]) -> [ResultMap?] in value.map { (value: SuggestedProduct?) -> ResultMap? in value.flatMap { (value: SuggestedProduct) -> ResultMap in value.resultMap } } }, forKey: "suggestedProducts")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var productFragment: ProductFragment {
          get {
            return ProductFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct SuggestedProduct: GraphQLSelectionSet {
        public static let possibleTypes = ["Product", "PromotionalProduct", "RelatedProduct"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ProductFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> SuggestedProduct {
          return SuggestedProduct(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "description": description, "price": price])
        }

        public static func makePromotionalProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> SuggestedProduct {
          return SuggestedProduct(unsafeResultMap: ["__typename": "PromotionalProduct", "id": id, "name": name, "description": description, "price": price])
        }

        public static func makeRelatedProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> SuggestedProduct {
          return SuggestedProduct(unsafeResultMap: ["__typename": "RelatedProduct", "id": id, "name": name, "description": description, "price": price])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var productFragment: ProductFragment {
            get {
              return ProductFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class GetDetailFragmentProductQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetDetailFragmentProduct($id: ID!) {\n  product(id: $id) {\n    __typename\n    ...ProductFragment\n    suggestedProducts {\n      __typename\n      ...ProductFragment\n      ... on RelatedProduct {\n        commonTags\n      }\n      ... on PromotionalProduct {\n        discount\n      }\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(ProductFragment.fragmentDefinition) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("product", arguments: ["id": GraphQLVariable("id")], type: .object(Product.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(product: Product? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
    }

    public var product: Product? {
      get {
        return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "product")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["Product"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ProductFragment.self),
        GraphQLField("suggestedProducts", type: .list(.object(SuggestedProduct.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var suggestedProducts: [SuggestedProduct?]? {
        get {
          return (resultMap["suggestedProducts"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SuggestedProduct?] in value.map { (value: ResultMap?) -> SuggestedProduct? in value.flatMap { (value: ResultMap) -> SuggestedProduct in SuggestedProduct(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [SuggestedProduct?]) -> [ResultMap?] in value.map { (value: SuggestedProduct?) -> ResultMap? in value.flatMap { (value: SuggestedProduct) -> ResultMap in value.resultMap } } }, forKey: "suggestedProducts")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var productFragment: ProductFragment {
          get {
            return ProductFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct SuggestedProduct: GraphQLSelectionSet {
        public static let possibleTypes = ["Product", "PromotionalProduct", "RelatedProduct"]

        public static let selections: [GraphQLSelection] = [
          GraphQLTypeCase(
            variants: ["RelatedProduct": AsRelatedProduct.selections, "PromotionalProduct": AsPromotionalProduct.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(ProductFragment.self),
            ]
          )
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> SuggestedProduct {
          return SuggestedProduct(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "description": description, "price": price])
        }

        public static func makeRelatedProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil, commonTags: String? = nil) -> SuggestedProduct {
          return SuggestedProduct(unsafeResultMap: ["__typename": "RelatedProduct", "id": id, "name": name, "description": description, "price": price, "commonTags": commonTags])
        }

        public static func makePromotionalProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil, discount: String? = nil) -> SuggestedProduct {
          return SuggestedProduct(unsafeResultMap: ["__typename": "PromotionalProduct", "id": id, "name": name, "description": description, "price": price, "discount": discount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var productFragment: ProductFragment {
            get {
              return ProductFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }

        public var asRelatedProduct: AsRelatedProduct? {
          get {
            if !AsRelatedProduct.possibleTypes.contains(__typename) { return nil }
            return AsRelatedProduct(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsRelatedProduct: GraphQLSelectionSet {
          public static let possibleTypes = ["RelatedProduct"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(ProductFragment.self),
            GraphQLField("commonTags", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, description: String? = nil, price: String? = nil, commonTags: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "RelatedProduct", "id": id, "name": name, "description": description, "price": price, "commonTags": commonTags])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var commonTags: String? {
            get {
              return resultMap["commonTags"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "commonTags")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var productFragment: ProductFragment {
              get {
                return ProductFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public var asPromotionalProduct: AsPromotionalProduct? {
          get {
            if !AsPromotionalProduct.possibleTypes.contains(__typename) { return nil }
            return AsPromotionalProduct(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsPromotionalProduct: GraphQLSelectionSet {
          public static let possibleTypes = ["PromotionalProduct"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(ProductFragment.self),
            GraphQLField("discount", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, description: String? = nil, price: String? = nil, discount: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PromotionalProduct", "id": id, "name": name, "description": description, "price": price, "discount": discount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var discount: String? {
            get {
              return resultMap["discount"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "discount")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var productFragment: ProductFragment {
              get {
                return ProductFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public final class GetBasicProductQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetBasicProduct($id: ID!) {\n  product(id: $id) {\n    __typename\n    id\n    name\n    description\n    price(currency: \"USD\")\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("product", arguments: ["id": GraphQLVariable("id")], type: .object(Product.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(product: Product? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
    }

    public var product: Product? {
      get {
        return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "product")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["Product"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("price", arguments: ["currency": "USD"], type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "description": description, "price": price])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var price: String? {
        get {
          return resultMap["price"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }
    }
  }
}

public final class GetSuggestedProductQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetSuggestedProduct($id: ID!) {\n  product(id: $id) {\n    __typename\n    id\n    name\n    description\n    price(currency: \"USD\")\n    suggestedProducts {\n      __typename\n      id\n      name\n      description\n      price(currency: \"USD\")\n    }\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("product", arguments: ["id": GraphQLVariable("id")], type: .object(Product.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(product: Product? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
    }

    public var product: Product? {
      get {
        return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "product")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["Product"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("price", arguments: ["currency": "USD"], type: .scalar(String.self)),
        GraphQLField("suggestedProducts", type: .list(.object(SuggestedProduct.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, description: String? = nil, price: String? = nil, suggestedProducts: [SuggestedProduct?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "description": description, "price": price, "suggestedProducts": suggestedProducts.flatMap { (value: [SuggestedProduct?]) -> [ResultMap?] in value.map { (value: SuggestedProduct?) -> ResultMap? in value.flatMap { (value: SuggestedProduct) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var price: String? {
        get {
          return resultMap["price"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var suggestedProducts: [SuggestedProduct?]? {
        get {
          return (resultMap["suggestedProducts"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SuggestedProduct?] in value.map { (value: ResultMap?) -> SuggestedProduct? in value.flatMap { (value: ResultMap) -> SuggestedProduct in SuggestedProduct(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [SuggestedProduct?]) -> [ResultMap?] in value.map { (value: SuggestedProduct?) -> ResultMap? in value.flatMap { (value: SuggestedProduct) -> ResultMap in value.resultMap } } }, forKey: "suggestedProducts")
        }
      }

      public struct SuggestedProduct: GraphQLSelectionSet {
        public static let possibleTypes = ["Product", "PromotionalProduct", "RelatedProduct"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("price", arguments: ["currency": "USD"], type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> SuggestedProduct {
          return SuggestedProduct(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "description": description, "price": price])
        }

        public static func makePromotionalProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> SuggestedProduct {
          return SuggestedProduct(unsafeResultMap: ["__typename": "PromotionalProduct", "id": id, "name": name, "description": description, "price": price])
        }

        public static func makeRelatedProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> SuggestedProduct {
          return SuggestedProduct(unsafeResultMap: ["__typename": "RelatedProduct", "id": id, "name": name, "description": description, "price": price])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var price: String? {
          get {
            return resultMap["price"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "price")
          }
        }
      }
    }
  }
}

public struct ProductFragment: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment ProductFragment on ProductInterface {\n  __typename\n  id\n  name\n  description\n  price(currency: \"USD\")\n}"

  public static let possibleTypes = ["Product", "PromotionalProduct", "RelatedProduct"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("price", arguments: ["currency": "USD"], type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public static func makeProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> ProductFragment {
    return ProductFragment(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "description": description, "price": price])
  }

  public static func makePromotionalProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> ProductFragment {
    return ProductFragment(unsafeResultMap: ["__typename": "PromotionalProduct", "id": id, "name": name, "description": description, "price": price])
  }

  public static func makeRelatedProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> ProductFragment {
    return ProductFragment(unsafeResultMap: ["__typename": "RelatedProduct", "id": id, "name": name, "description": description, "price": price])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var price: String? {
    get {
      return resultMap["price"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "price")
    }
  }
}

public struct ProductDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment ProductDetails on ProductInterface {\n  __typename\n  id\n  name\n  description\n  price(currency: \"USD\")\n}"

  public static let possibleTypes = ["Product", "PromotionalProduct", "RelatedProduct"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("price", arguments: ["currency": "USD"], type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public static func makeProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> ProductDetails {
    return ProductDetails(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "description": description, "price": price])
  }

  public static func makePromotionalProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> ProductDetails {
    return ProductDetails(unsafeResultMap: ["__typename": "PromotionalProduct", "id": id, "name": name, "description": description, "price": price])
  }

  public static func makeRelatedProduct(id: GraphQLID, name: String, description: String? = nil, price: String? = nil) -> ProductDetails {
    return ProductDetails(unsafeResultMap: ["__typename": "RelatedProduct", "id": id, "name": name, "description": description, "price": price])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var price: String? {
    get {
      return resultMap["price"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "price")
    }
  }
}