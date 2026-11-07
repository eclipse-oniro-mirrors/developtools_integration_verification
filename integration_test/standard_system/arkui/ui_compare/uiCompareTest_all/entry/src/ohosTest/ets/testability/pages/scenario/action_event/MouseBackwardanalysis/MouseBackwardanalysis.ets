/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Entry
@Component
struct MouseBackwardanalysis {
  @State inputLog: string = '';
  @State posLog: string = '';

  build() {
    Column() {
      Text(this.inputLog ? '输入: ' + this.inputLog : '输入: (在蓝色A、绿色B区域间移动/点击后显示)').fontSize(12).fontColor(Color.Blue).margin(6)
      Text(this.posLog ? '检查结果(鼠标坐标): ' + this.posLog : '检查结果: (在A/B间移动后显示坐标)').fontSize(12).fontColor(Color.Red).margin(8)
      Row() {
        Column()
          .width('16.67%')
          .height('6.56%')
          .backgroundColor(Color.Blue)
          .onMouse((event?: MouseEvent) => {
            if (event) {
              this.inputLog = (this.inputLog ? this.inputLog + '→' : '') + 'A';
              this.inputLog = this.inputLog.slice(-30);
              const s = 'A:' + event.x + ',' + event.y + ' ';
              this.posLog = (this.posLog + s).slice(-120);
            }
          })
          .id('MouseBackwardanalysis_A')
          .margin(8)
        Column()
          .width('16.67%')
          .height('6.56%')
          .backgroundColor(Color.Green)
          .onMouse((event?: MouseEvent) => {
            if (event) {
              this.inputLog = (this.inputLog ? this.inputLog + '→' : '') + 'B';
              this.inputLog = this.inputLog.slice(-30);
              const s = 'B:' + event.x + ',' + event.y + ' ';
              this.posLog = (this.posLog + s).slice(-120);
            }
          })
          .id('MouseBackwardanalysis_B')
          .margin(8)
      }
    }
    .width('100%')
    .height('100%')
  }
}
