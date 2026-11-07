/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@ComponentV2
struct StateRepeatArrayLike003 {
  @Local numArr1: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @Local numArr2: number[] = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
  @Local numArr3: number[] = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29];
  @Local numArr4: number[] = [30, 31, 32, 33, 34, 35, 36, 37, 38, 39];
  @Local numArr5: number[] = [40, 41, 42, 43, 44, 45, 46, 47, 48, 49];
  @Local numArr6: number[] = [50, 51, 52, 53, 54, 55, 56, 57, 58, 59];
  @Local numArr7: number[] = [60, 61, 62, 63, 64, 65, 66, 67, 68, 69];
  @Local dataArr: ReadonlyArray<number[]> = [this.numArr1, this.numArr2, this.numArr3, this.numArr4, this.numArr5, this.numArr6, this.numArr7];

  build() {
    Column() {
      List() {
        Repeat<number[]>(this.dataArr)
          .each((ri: RepeatItem<number[]>) => {
            ListItem() {
              Text('each_' + ri.item)
                .fontSize(33)
            }
          })
          .virtualScroll({ totalCount: this.dataArr.length })
      }
      .cachedCount(2)
      .height('70%')
      .border({ width: 1 })
    }
  }
}