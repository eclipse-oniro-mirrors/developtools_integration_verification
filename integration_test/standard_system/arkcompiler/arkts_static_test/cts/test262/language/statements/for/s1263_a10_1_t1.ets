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

// arktsid: s1263_a10_1_t1
// description: Checking if executing nested "var-loops" nine blocks depth is evaluated properly

function main(): void {
    let result: string = '';
    for (let index0: int = 0; index0 <= 1; ++index0) {
        for (let index1: int = 0; index1 <= index0; ++index1) {
            for (let index2: int = 0; index2 <= index1; ++index2) {
                for (let index3: int = 0; index3 <= index2; ++index3) {
                    for (let index4: int = 0; index4 <= index3; ++index4) {
                        for (let index5: int = 0; index5 <= index4; ++index5) {
                            for (let index6: int = 0; index6 <= index5; ++index6) {
                                for (let index7: int = 0; index7 <= index6; ++index7) {
                                    for (let index8: int = 0; index8 <= index1; ++index8) {
                                        result += index0.toString() + index1.toString() + index2.toString() +
                                            index3.toString() + index4.toString() + index5.toString() +
                                            index6.toString() + index7.toString() + index8.toString() + '\n';
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

        arktest.assertEQ(result,
                '000000000\n100000000\n110000000\n110000001\n111000000\n111000001\n111100000\n111100001\n111110000\n1' +
            '11110001\n111111000\n111111001\n111111100\n111111101\n111111110\n111111111\n');
}