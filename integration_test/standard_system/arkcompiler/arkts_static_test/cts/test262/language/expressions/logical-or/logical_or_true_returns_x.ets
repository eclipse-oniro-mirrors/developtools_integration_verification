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

// arktsid: logical_or_true_returns_x
// description: If ToBoolean(x) is true, return x (boolean operands)
// Conversion notes: kept CHECK#1/2; dropped CHECK#3-6 (new Boolean(...) wrapper
// — object identity, no ArkTS equivalent).

function main(): void {
    // CHECK#1: (true || true) === true
    arktest.assertTrue(true || true);
    // CHECK#2: (true || false) === true
    arktest.assertTrue(true || false);
}
