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
desc: A carriage return terminates a single-line comment
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0202: 'this' cannot be referenced from a static context",
    "Syntax error ESY0227: Unexpected token 'text'.",
    "Semantic error ESE0143: Unresolved reference text",
    "Syntax error ESY169587: 'is' operator is not supported. Use 'instanceof' instead to check whether a variable is
    instance of a given type and use 'as' operator to cast to the appropriate type!",
    "Syntax error ESY0227: Unexpected token 'is'.",
    "Semantic error ESE0143: Unresolved reference is",
    "Syntax error ESY0227: Unexpected token 'not'.",
    "Semantic error ESE0143: Unresolved reference not",
    "Syntax error ESY0227: Unexpected token 'included'.",
    "Semantic error ESE0143: Unresolved reference included",
    "Syntax error ESY105822: 'in' operator is not supported. Use 'instanceof' operator to check whether an object is
    the instance of a class that contains the necessary class member.",
    "Syntax error ESY0227: Unexpected token 'single'.",
    "Semantic error ESE0143: Unresolved reference single",
    "Semantic error ESE0143: Unresolved reference line",
    "Syntax error ESY0227: Unexpected token 'comment'.",
    "Semantic error ESE0143: Unresolved reference comment",
    "Syntax error ESY0227: Unexpected token 'that'.",
    "Semantic error ESE0143: Unresolved reference that",
    "Syntax error ESY0227: Unexpected token 'precedes'.",
    "Semantic error ESE0143: Unresolved reference precedes",
    "Syntax error ESY0227: Unexpected token 'it'.",
    "Semantic error ESE0143: Unresolved reference it",
]
---*/
function main(): void {}
//
 this text is not included in the single-line comment that precedes it
