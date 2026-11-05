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

// See http://crbug.com/39160

// To reproduce the bug we need an inlined comparison (i.e. in a loop) where
// the left hand side is known to be a smi (max smi value is  1073741823). This
// test crashes with the bug.

function exerciseLargeIntComparison(value: int): void {
  for (let i: int = 1073741820; i < 1073741822; i++) {
    if (value < i) {
      value += i;
    }
  }
}

function main(): void {
  exerciseLargeIntComparison(5);
}
