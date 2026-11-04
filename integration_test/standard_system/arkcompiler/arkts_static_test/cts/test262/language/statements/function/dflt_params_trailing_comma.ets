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
// arktsid: dflt_params_trailing_comma
// description: A trailing comma should not increase the respective length, using default parameters (function
// declaration)

function ref(a: int, b: int = 39,): void {
    arktest.assertEQ(a, 42);
    arktest.assertEQ(b, 39);
}

function main(): void {
    ref(42);
}