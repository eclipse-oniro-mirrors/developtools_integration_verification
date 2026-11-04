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

// arktsid: logical_and_false_returns_x
// description: If ToBoolean(x) is false, return x (boolean operands)
// Conversion notes: kept CHECK#1/2; dropped CHECK#3/4 (new Boolean(...) wrapper
// — object identity, no ArkTS equivalent).

function main(): void {
    // CHECK#1: (false && true) === false
    arktest.assertFalse(false && true);
    // CHECK#2: (false && false) === false
    arktest.assertFalse(false && false);
}
