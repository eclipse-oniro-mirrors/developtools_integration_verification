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

interface DividerResult {
  s: double;
  e: double;
  i: double;
}

class TimerValue {
  private leftTime: double = 12345678.0;

  divide(): DividerResult {
    const s: double = Math.floor(this.leftTime / 3600.0);
    const e: double = Math.floor(s / 24.0);
    const i: double = s % 24.0;
    return {s: s, e: e, i: i};
  }
}

function main(): void {
  const value: TimerValue = new TimerValue();
  for (let i: int = 0; i < 1000; i++) {
    value.divide();
  }
}
