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

function main(): void {
  const firstResult: RegExpExecArray | null = new RegExp('[--𐀾]', 'u').exec('Hr3QoS3KCWXQ2yjBoDIK');
  arktest.assertNE(null, firstResult);
  arktest.assertEQ(firstResult![0], 'H');

  const secondResult: RegExpExecArray | null = new RegExp('[0-\\u{10000}]', 'u').exec('A0');
  arktest.assertNE(null, secondResult);
  arktest.assertEQ(secondResult![0], 'A');
}
