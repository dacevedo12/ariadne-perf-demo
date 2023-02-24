from ariadne.asgi import (
    GraphQL,
)
from ariadne.asgi.handlers import (
    GraphQLHTTPHandler,
)
from ariadne import (
    make_executable_schema,
    QueryType,
)
from ariadne.types import Extension

SDL = """
    type Query {
        hello: String!
    }
"""

for i in range(150):
    SDL += f"""
    type DemoType{i} {{
        demo: String!
    }}
    """

QUERY = QueryType()

@QUERY.field("hello")
def resolve(*_):
    return "Hello world!"


SCHEMA = make_executable_schema(SDL, QUERY)

class DemoExtension(Extension):
    pass


APP = GraphQL(
    schema=SCHEMA,
    debug=True,
    http_handler=GraphQLHTTPHandler(extensions=[DemoExtension]),
)