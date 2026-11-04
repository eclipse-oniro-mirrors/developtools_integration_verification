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

// arktsid: conditional_false_condition_nullish
// description: If ToBoolean(x) is false, return z (z is undefined/null)

function main(): void {
    // ToBoolean(false) is false -> return z (undefined)
    let z1: boolean | undefined = false ? true : undefined;
    arktest.assertEQ(z1, undefined);
    // ToBoolean(false) is false -> return z (null)
    let z2: boolean | null = false ? true : null;
    arktest.assertEQ(z2, null);
}
