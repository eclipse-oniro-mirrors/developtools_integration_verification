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

// arktsid: logical_not_nullish
// description: Operator !x returns !ToBoolean(x) (undefined or null)
// Conversion notes: JS void 0 is undefined; ArkTS has no void operator, so
// CHECK#1 uses the undefined literal.

function main(): void {
    // CHECK#1: !void 0 === true (void 0 -> undefined)
    arktest.assertEQ(!undefined, true);
    // CHECK#2: !null === true
    arktest.assertEQ(!null, true);
}
