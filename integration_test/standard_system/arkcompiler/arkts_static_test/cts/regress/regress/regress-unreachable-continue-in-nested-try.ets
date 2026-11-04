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

// This used to crash because the label collector in the parser didn't
// discard duplicates which caused the outer-most continue statement
// to try to unlink the inner try-handler that wasn't on the stack.

function exerciseNestedContinue(): int {
  try {
    for (let i: int = 0; i < 2; i++) {
      continue;
      try {
        continue;
        continue;
      } catch (error) {
      }
    }
  } catch (error) {
  }
  return 42;
}

function main(): void {
  arktest.assertEQ(42, exerciseNestedContinue());
}
