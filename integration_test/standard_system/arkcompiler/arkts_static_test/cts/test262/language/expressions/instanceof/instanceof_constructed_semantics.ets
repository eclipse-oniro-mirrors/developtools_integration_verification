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

// arktsid: instanceof_constructed_semantics
// description: instanceof true means the value was constructed with the constructor

class Base {}
class Derived extends Base {}
class Other {}

function main(): void {
    let obj = new Base();
    arktest.assertTrue(obj instanceof Base);
    // a Derived instance is also an instance of its base
    let d = new Derived();
    arktest.assertTrue(d instanceof Derived);
    arktest.assertTrue(d instanceof Base);
    // an instance is not an instance of an unrelated constructor
    arktest.assertFalse(d instanceof Other);
}
