// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

// Copyright (c) {{LICENSE_YEAR}}, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

public type CreateImageEditRequest record {
    # The image to edit. Must be a valid PNG file, less than 4MB, and square. If mask is not provided, image must have transparency, which will be used as the mask.
    record {byte[] fileContent; string fileName;} image;
    # A text description of the desired image(s). The maximum length is 1000 characters.
    string prompt;
    # An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where `image` should be edited. Must be a valid PNG file, less than 4MB, and have the same dimensions as `image`.
    record {byte[] fileContent; string fileName;} mask?;
    # The model to use for image generation. Only `dall-e-2` is supported at this time.
    string|"dall-e-2"? model = "dall-e-2";
    # The number of images to generate. Must be between 1 and 10.
    int? n = 1;
    # The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    "256x256"|"512x512"|"1024x1024"? size = "1024x1024";
    # The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated.
    "url"|"b64_json"? response_format = "url";
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

public type CreateImageRequest record {
    # A text description of the desired image(s). The maximum length is 1000 characters for `dall-e-2` and 4000 characters for `dall-e-3`.
    string prompt;
    # The model to use for image generation.
    string|"dall-e-2"|"dall-e-3"? model = "dall-e-2";
    # The number of images to generate. Must be between 1 and 10. For `dall-e-3`, only `n=1` is supported.
    int? n = 1;
    # The quality of the image that will be generated. `hd` creates images with finer details and greater consistency across the image. This param is only supported for `dall-e-3`.
    "standard"|"hd" quality = "standard";
    # The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated.
    "url"|"b64_json"? response_format = "url";
    # The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`. Must be one of `1024x1024`, `1792x1024`, or `1024x1792` for `dall-e-3` models.
    "256x256"|"512x512"|"1024x1024"|"1792x1024"|"1024x1792"? size = "1024x1024";
    # The style of the generated images. Must be one of `vivid` or `natural`. Vivid causes the model to lean towards generating hyper-real and dramatic images. Natural causes the model to produce more natural, less hyper-real looking images. This param is only supported for `dall-e-3`.
    "vivid"|"natural"? style = "vivid";
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Represents the url or the content of an image generated by the OpenAI API.
public type Image record {
    # The base64-encoded JSON of the generated image, if `response_format` is `b64_json`.
    string b64_json?;
    # The URL of the generated image, if `response_format` is `url` (default).
    string url?;
    # The prompt that was used to generate the image, if there was any revision to the prompt.
    string revised_prompt?;
};

public type ImagesResponse record {
    int created;
    Image[] data;
};

public type CreateImageVariationRequest record {
    # The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
    record {byte[] fileContent; string fileName;} image;
    # The model to use for image generation. Only `dall-e-2` is supported at this time.
    string|"dall-e-2"? model = "dall-e-2";
    # The number of images to generate. Must be between 1 and 10. For `dall-e-3`, only `n=1` is supported.
    int? n = 1;
    # The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated.
    "url"|"b64_json"? response_format = "url";
    # The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    "256x256"|"512x512"|"1024x1024"? size = "1024x1024";
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
};

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};
