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

// arktsid: conditional_true_condition_nullish
// description: If ToBoolean(x) is true, return y (y is undefined/null)

function main(): void {
    // ToBoolean(true) is true -> return y (undefined)
    let y1: boolean | undefined = true ? undefined : true;
    arktest.assertEQ(y1, undefined);
    // ToBoolean(true) is true -> return y (null)
    let y2: boolean | null = true ? null : true;
    arktest.assertEQ(y2, null);
}
