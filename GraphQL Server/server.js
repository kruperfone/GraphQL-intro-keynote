const { graphqlExpress, graphiqlExpress } = require('apollo-server-express');
const bodyParser = require('body-parser');
const cors = require('cors');
const express = require('express');
const { makeExecutableSchema } = require('graphql-tools');

const port = process.env.PORT || 9000;

const typeDefs = `
    interface ProductInterface {
        id: ID!
        name: String!
        description: String
        price(currency: String): String!
    }

    type PromotionalProduct implements ProductInterface {
        id: ID!
        name: String!
        description: String
        price(currency: String): String!
        discount: String
    }

    type RelatedProduct implements ProductInterface {
        id: ID!
        name: String!
        description: String
        price(currency: String): String!
        commonTags: String
    }

    type Product implements ProductInterface {
        id: ID!
        name: String!
        description: String
        price(currency: String): String!
        suggestedProducts: [ProductInterface]!
    }

    type Query {
        product(id: ID!): Product
    }
`;

const product = {
    id: '1',
    name: 'Pillow',
    description: 'Soft rectangle',
    price: '$10',
    suggestedProducts: [ {
        id: '2',
        name: 'Blanket',
        description: 'Warm and rectangle shaped',
        price: '$25',
        commonTags: 'bed, home'
    }, {
        id: '3',
        name: 'Bicycle',
        description: 'Desc',
        price: '$85',
        discount: '33.(3)%'
    }
    ]
};

const resolvers = {
    ProductInterface: {
        __resolveType(obj, context, info){
      if(obj.commonTags){
        return 'RelatedProduct';
      }

      if(obj.discount){
        return 'PromotionalProduct';
      }

      return null;
    },
    },
    Query: {
        product: (root, { id }) => product
    }
};

const schema = makeExecutableSchema({ typeDefs, resolvers });

const app = express();
app.use(cors(), bodyParser.json());
app.use('/graphql', graphqlExpress({schema}));
app.use('/graphiql', graphiqlExpress({endpointURL: 'graphql'}));
app.listen(port, () => console.log(`Server is running on port ${port}`));
