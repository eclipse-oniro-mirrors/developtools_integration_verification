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

// arktsid: number_values_are_unchanged_by_unary_plus
// description: Number values are unchanged by unary plus

function main(): void {
    arktest.assertEQ(+(13), 13);
    arktest.assertEQ(+(-13), -13);
    arktest.assertEQ(+(1.3), 1.3);
    arktest.assertEQ(+(-1.3), -1.3);
}
