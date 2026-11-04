/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: Extra characters before an HTML close comment are a syntax error
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0143: Unresolved reference the",
    "Syntax error ESY0227: Unexpected token 'comment'.",
    "Semantic error ESE0143: Unresolved reference comment",
    "Syntax error ESY0227: Unexpected token 'should'.",
    "Semantic error ESE0143: Unresolved reference should",
    "Syntax error ESY0227: Unexpected token 'not'.",
    "Semantic error ESE0143: Unresolved reference not",
    "Syntax error ESY0227: Unexpected token 'include'.",
    "Semantic error ESE0143: Unresolved reference include",
    "Syntax error ESY0227: Unexpected token 'these'.",
    "Semantic error ESE0143: Unresolved reference these",
    "Syntax error ESY0227: Unexpected token 'characters'.",
    "Semantic error ESE0143: Unresolved reference characters",
    "Syntax error ESY0227: Unexpected token ','.",
    "Syntax error ESY0227: Unexpected token 'regardless'.",
    "Semantic error ESE0143: Unresolved reference regardless",
    "Syntax error ESY0227: Unexpected token 'of'.",
    "Semantic error ESE0143: Unresolved reference of",
    "Syntax error ESY0227: Unexpected token 'AnnexB'.",
    "Semantic error ESE0143: Unresolved reference AnnexB",
    "Syntax error ESY0227: Unexpected token 'extensions'.",
    "Semantic error ESE0143: Unresolved reference extensions",
    "Syntax error ESY0227: Unexpected token 'end of stream'.",
]
---*/

function main(): void {}
/*
*/ the comment should not include these characters, regardless of AnnexB extensions -->
