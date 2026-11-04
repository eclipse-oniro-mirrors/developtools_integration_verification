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

// arktsid: optional_chain_prod_arguments
// description: the ?.(Arguments) optional-call production
// Conversion notes: covers an optional call with defaulted third argument and a built-in-style string conversion call.

function fn(arg1: int, arg2: int, arg3: int = 0): int {
    return arg1 + arg2 + arg3;
}

function toStr(arg: int): string {
    return arg.toString();
}

function main(): void {
    arktest.assertEQ(30, fn?.(10, 20));
    arktest.assertEQ('42', toStr?.(42));
}
