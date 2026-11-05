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
// arktsid: s13_a3_t3
// description: Creating simple recursive function that calculates factorial

function fact(arg: number): number {
    if (arg === 1) {
        return arg;
    } else {
        return fact(arg - 1) * arg;
    }
}

function main(): void {
    arktest.assertEQ(fact(3), 6);
}
