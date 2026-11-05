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
  const date: Date = new Date(1009804000000);
  const matchResult: RegExpMatchArray =
    String(date).match(new RegExp('.*(200\\d)'))!;
  const year: int = Long.parseInt(matchResult[1]!, 10).toInt();
  arktest.assertEQ(year, date.getFullYear());
}
