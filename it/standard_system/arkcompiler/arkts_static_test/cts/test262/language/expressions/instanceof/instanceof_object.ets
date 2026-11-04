/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: instanceof_object
// description: object instanceof Object is true
// Conversion notes: The "var OBJECT = Object; x instanceof OBJECT" cases are dropped because a class cannot be assigned
// to a variable in ArkTS.

class MyClass {}

function main(): void {
    let obj = new MyClass();
    arktest.assertTrue(obj instanceof Object);
    arktest.assertTrue(obj instanceof MyClass);
}