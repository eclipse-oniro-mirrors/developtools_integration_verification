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

// arktsid: typeof_ordinary_object_no_call
// description: typeof Object (ordinary and does not implement [[Call]]) === "object"
// Conversion notes: Math/Reflect are class namespaces in ArkTS, not values, so a user class instance stands in for an
// ordinary non-callable object.

class PlainObject {
    public value: number = 1;
}

function main(): void {
    let obj = new PlainObject();
    arktest.assertEQ(typeof obj, 'object');
}