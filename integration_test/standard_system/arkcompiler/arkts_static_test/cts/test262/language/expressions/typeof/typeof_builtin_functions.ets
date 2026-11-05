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

// arktsid: typeof_builtin_functions
// description: typeof Object (implements [[Call]]) === "function"
// Conversion notes: Math.exp and parseInt are not accessible as values in ArkTS, so a top-level function reference
// stands in; typeof on any callable returns "function".

function userFunction(): void {}

function main(): void {
    arktest.assertEQ(typeof userFunction, 'function');
}