/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


function runBitwiseShiftLoop(): void {
  for (let i: int = 0; i < 4004; i++) {
    let shiftedRight: int = 1 >>> i;
    let shiftCount: int = 32 - i;
    let shiftedLeft: int = 1 << shiftCount;
    let combined: int = shiftedRight & shiftedLeft;
  }
}

function main(): void {
  runBitwiseShiftLoop();
  runBitwiseShiftLoop();
}
