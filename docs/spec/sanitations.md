_Authors_: @G5andeepD \
_Created_: 2024/08/05 \
_Updated_: 2024/08/05 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from OpenAI. The OpenAPI specification is obtained from the [OpenAI OpenAPI Documentation](https://github.com/openai/openai-openapi/blob/master/openapi.yaml). These changes are implemented to enhance the overall usability and readability of the generated client.

1. **removing `default:null` of certain schemas**:
   - **Changed Schemas**: `CreateCompletionRequest`,`ChatCompletionStreamOptions`,`CreateChatCompletionRequest`
   - **Reason**: This change is done as a workaround for ballerina openapi tool not allowing to generate the client.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/openapi.yaml --mode client --tags Images --license docs/license.txt -o ballerina
```
Note: The license year is hardcoded to 2024, change if necessary.