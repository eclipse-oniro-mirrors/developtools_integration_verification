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
struct GestureDynamic {
  @State dynamicId: string = 'id_0';
  @State dynamicKey: string = 'key_0';
  @State clickCount: number = 0;
  @State inputLog: string = '';
  @State log: string = '';

  build() {
    Column() {
      Text('GestureDynamic').fontSize(16).margin(8)
      Text(this.inputLog ? '输入: ' + this.inputLog : '输入: (点击动态id按钮后显示)').fontSize(12).fontColor(Color.Blue).margin(6)
      Button('切换id').id('btn_switch_id').onClick(() => {
        this.dynamicId = this.dynamicId === 'id_0' ? 'id_1' : 'id_0';
      }).margin(4)
      Button('当前id:' + this.dynamicId).id(this.dynamicId).onClick(() => {
        this.clickCount++;
        this.inputLog = '点击 动态id(' + this.dynamicId + ')';
        this.log = '检查结果 id:' + this.dynamicId + ' area:热区';
      }).margin(4)
      Button('切换key').id('btn_switch_key').onClick(() => {
        this.dynamicKey = this.dynamicKey === 'key_0' ? 'key_1' : 'key_0';
      }).margin(4)
      Text(this.log ? 'clickCount:' + this.clickCount + ' ' + this.log : '检查结果: (点击动态id/key按钮后显示)').fontSize(12).fontColor(Color.Red).margin(8)
    }
    .width('100%')
    .height('100%')
  }
}
