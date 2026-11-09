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
struct HoverEvent {
  @State inputLog: string = '';
  @State log: string = '';

  build() {
    Column() {
      Text('HoverEvent').fontSize(16).margin(8)
      Text(this.inputLog ? '输入: ' + this.inputLog : '输入: (悬浮各组件后显示)').fontSize(12).fontColor(Color.Blue).margin(6)
      Button('button').id('button').onHover((v: boolean) => { this.inputLog = '悬浮 button'; this.log = '检查结果 id:button area:热区 hover:' + v; }).margin(4)
      Menu().id('Menu').margin(4)
      TextArea({ placeholder: 'TextArea' }).id('TextArea').height(60).onHover((v: boolean) => { this.inputLog = '悬浮 TextArea'; this.log = '检查结果 id:TextArea area:热区 hover:' + v; }).margin(4)
      Text(this.log ? this.log : '检查结果: (悬浮button/TextArea后显示id与area)').fontSize(12).fontColor(Color.Red).margin(8)
    }
    .width('100%')
    .height('100%')
  }
}
