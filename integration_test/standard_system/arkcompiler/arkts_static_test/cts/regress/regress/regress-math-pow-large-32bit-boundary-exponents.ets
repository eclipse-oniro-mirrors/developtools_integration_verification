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
  const positiveBoundary: double = 2147483648.0;
  const positiveBeyondBoundary: double = 3221225472.0;
  const negativeBoundary: double = -2147483648.0;

  const result1: double = Math.pow(2.0, positiveBoundary);
  arktest.assertEQ(Infinity, result1);

  const result2: double = Math.pow(2.0, positiveBeyondBoundary);
  arktest.assertEQ(Infinity, result2);

  const result3: double = Math.pow(2.0, negativeBoundary);
  arktest.assertPositiveZero(result3);
}
