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
import { router } from '@kit.ArkUI';

@Entry
@Component
struct UiAbilityPage210 {
  @State message: string = 'SUB_ACE_UI_ABILITY_PAGE_0210';
  @State operationLog: string = '';

  aboutToAppear(): void { this.addLog('窗口A Index aboutToAppear'); this.observerOn(); }
  onPageShow(): void { this.addLog('窗口A Index OnPageShow'); }
  onPageHide(): void { this.addLog('窗口A Index OnPageHide'); }

  addLog(msg: string): void {
    this.operationLog = `[${new Date().toLocaleTimeString()}] ${msg}\n${this.operationLog}`;
  }

  observerOn(): void {
    this.addLog('✅ 模拟开启页面监听 (UI对比测试)');
  }


  routerPageOne(): void {
    this.addLog('push到 PageOne');
    router.pushUrl({ url: 'testability/pages/scenario/misc/UiAbilityPage/UiAbilityPage211' });
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message).fontSize(20).fontWeight(FontWeight.Bold)
      Text('UIAbility监听OnPageShow/Hide(前后台切换)').fontSize(14).fontColor(Color.Gray)
      Divider()
      Button('A router pageOne').onClick(() => this.routerPageOne()).width('80%').id('btn')
      Text('跳转后退到后台再返回前台').fontSize(14).fontColor(Color.Orange).margin({ top: 10 })
      Scroll() {
        Text(this.operationLog).fontSize(12).width('100%').padding(10).backgroundColor('#F5F5F5').borderRadius(5)
      }.width('100%').height('350')
    }.width('100%').height('100%').padding(20)
  }
}

