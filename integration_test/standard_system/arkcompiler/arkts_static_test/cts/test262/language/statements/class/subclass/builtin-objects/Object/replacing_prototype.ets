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

// arktsid: replacing_prototype
// description: subclass Object overriding prototype method valueOf
// Conversion notes: 源 `valueOf()` 无返回类型注解；ArkTS 方法须显式返回类型 `number`。

class Obj extends Object {
    valueOf(): number {
        return 42;
    }
}

function main(): void {
    let obj: Obj = new Obj();
    arktest.assertTrue(obj.valueOf() === 42);
}
