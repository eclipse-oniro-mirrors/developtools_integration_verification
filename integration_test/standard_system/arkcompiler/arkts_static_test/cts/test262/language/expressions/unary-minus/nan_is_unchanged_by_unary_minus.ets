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

// arktsid: nan_is_unchanged_by_unary_minus
// description: Unary minus preserves NaN

function main(): void {
    arktest.assertTrue(Number.isNaN(-NaN));
    let x: double = NaN;
    arktest.assertTrue(Number.isNaN(-x));
}
