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
struct Mouse {
  @State inputLog: string = '';
  @State msg: string = '';
  @State hoverNoHover: boolean = false;
  @State hoverOnMouse: boolean = false;

  build() {
    Column() {
      Text(this.inputLog ? '输入: ' + this.inputLog : '输入: (点击按钮后显示)').fontSize(12).fontColor(Color.Blue).margin(6)
      Text(this.msg ? '检查结果: ' + this.msg : '检查结果: (操作后显示onMouse信息)').fontSize(14).fontColor(Color.Red).margin(8)
      Button('点击测试onMouse')
        .onMouse((event?: MouseEvent) => {
          if (event) {
            this.inputLog = '点击【点击测试onMouse】按钮';
            this.msg = 'onMouse: x=' + event.x + ',y=' + event.y;
          }
        })
        .id('Mouse_btn')
        .margin(8)
      Row() {
        Button('no hover')
          .backgroundColor(this.hoverNoHover ? Color.Pink : Color.Gray)
          .id('Mouse_no_hover')
          .margin(8)
        Button('onMouse')
          .backgroundColor(this.hoverOnMouse ? Color.Pink : Color.Gray)
          .onMouse((event?: MouseEvent) => {
            if (event) {
              this.inputLog = '点击【onMouse】按钮';
              this.msg = 'onMouse: x=' + event.x + ',y=' + event.y;
            }
          })
          .onHover((isHover?: boolean) => {
            this.hoverOnMouse = isHover ?? false;
          })
          .id('Mouse_onMouse_btn')
          .margin(8)
      }
    }
    .width('100%')
    .height('100%')
  }
}
