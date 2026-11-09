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
struct UiAbilityPage131 {
  @State message: string = 'PageOne';
  @State operationLog: string = '';

  aboutToAppear(): void { this.addLog('PageOne aboutToAppear'); }
  onPageShow(): void { this.addLog('PageOne OnPageShow'); }

  addLog(msg: string): void {
    this.operationLog = `[${new Date().toLocaleTimeString()}] ${msg}\n${this.operationLog}`;
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message).fontSize(24).fontWeight(FontWeight.Bold)
      Text('横竖屏切换测试').fontSize(16).fontColor(Color.Orange).fontWeight(FontWeight.Bold)
      Text('切换横竖屏不应触发生命周期事件').fontSize(14).fontColor(Color.Gray)
      Scroll() {
        Text(this.operationLog).fontSize(12).width('100%').padding(10).backgroundColor('#F5F5F5').borderRadius(5)
      }.width('100%').height('400')
    }.width('100%').height('100%').padding(20)
  }
}

