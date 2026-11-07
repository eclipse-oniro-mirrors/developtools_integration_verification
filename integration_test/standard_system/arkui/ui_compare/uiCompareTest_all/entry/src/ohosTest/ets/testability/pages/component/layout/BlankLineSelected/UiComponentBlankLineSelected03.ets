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
@Component
struct UiComponentBlankLineSelected03 {
  @State onCopy: string = '';
  @State text: string =
    '                                                                 ';
  @State start: number = -1;
  @State end: number = 20;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      Text(this.text)
        .fontSize(12)
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .copyOption(CopyOptions.InApp)
        .selection(this.start, this.end)
        .onCopy((value: string) => {
          this.onCopy = value;
        })
        .baselineOffset(-20)
        .draggable(true)
        .caretColor(Color.Red)
        .selectedBackgroundColor(Color.Grey)
        .enableHapticFeedback(true)
        .textIndent(60)
        .height(100)
        .width(100)
      Button('Set text selection')
        .margin({ left: 20 })
        .onClick(() => {
          // 变更文本选中起始点、终点
          this.start = 10;
          this.end = 30;
        })
      Text(this.onCopy).fontSize(12).margin(10).key('copy')
    }.height('100%').width('100%').padding({ left: 35, right: 35, top: 35 })
  }
}
