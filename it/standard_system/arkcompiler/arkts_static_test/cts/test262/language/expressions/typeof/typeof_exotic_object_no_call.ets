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

// arktsid: typeof_exotic_object_no_call
// description: typeof standard built-in object instances (without [[Call]]) === "object"
// Conversion notes: "typeof this" is dropped (no global this in ArkTS); Array is written with an explicit element type.
// String/Boolean/Number are primitive-like in ArkTS (new String() reports "string", new Boolean() "boolean", new
// Number() "number"), so they are excluded as deviations.

function main(): void {
    let emptyObj: Object = {};
    let emptyArr: Object[] = [];
    arktest.assertEQ(typeof emptyObj, 'object');
    arktest.assertEQ(typeof emptyArr, 'object');
    arktest.assertEQ(typeof new Date(0), 'object');
    arktest.assertEQ(typeof new Error('x'), 'object');
}