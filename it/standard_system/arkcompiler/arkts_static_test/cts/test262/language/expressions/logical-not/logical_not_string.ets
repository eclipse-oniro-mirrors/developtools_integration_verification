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

// arktsid: logical_not_string
// description: Operator !x returns !ToBoolean(x) (string primitive)
// Conversion notes: kept CHECK#1/3/4 (string primitives); dropped CHECK#2/5
// (new String(...) wrapper — no ArkTS equivalent).

function main(): void {
    // CHECK#1: !"1" === false
    arktest.assertEQ(!'1', false);
    // CHECK#3: !"x" === false
    arktest.assertEQ(!'x', false);
    // CHECK#4: !"" === true
    arktest.assertEQ(!'', true);
}
