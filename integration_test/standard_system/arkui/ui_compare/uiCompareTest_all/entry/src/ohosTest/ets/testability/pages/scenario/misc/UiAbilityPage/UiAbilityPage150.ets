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
struct UiAbilityPage150 {
  @State message: string = 'SUB_ACE_UI_ABILITY_PAGE_0150';
  @State operationLog: string = '';

  aboutToAppear(): void { this.addLog('窗口A Index aboutToAppear'); }
  onPageShow(): void { this.addLog('窗口A Index OnPageShow'); }
  onPageHide(): void { this.addLog('窗口A Index OnPageHide'); }

  addLog(msg: string): void {
    this.operationLog = `[${new Date().toLocaleTimeString()}] ${msg}\n${this.operationLog}`;
  }

  routerPageOne(): void {
    this.addLog('窗口A push到 PageOne');
    router.pushUrl({ url: 'testability/pages/scenario/misc/UiAbilityPage/UiAbilityPage151' });
  }

  routerIndex(): void {
    this.addLog('窗口A 返回 Index');
    router.back();
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message).fontSize(20).fontWeight(FontWeight.Bold)
      Text('UIAbility observer.on/off监听页面生命周期').fontSize(14).fontColor(Color.Gray)
      Divider()
      Text('窗口A操作').fontSize(16).fontWeight(FontWeight.Medium).margin({ top: 10 })
      Button('A router pageOne').onClick(() => this.routerPageOne()).width('80%').id('btn')
      Button('A router Index').onClick(() => this.routerIndex()).width('80%').backgroundColor('#409EFF')
      Scroll() {
        Text(this.operationLog).fontSize(12).width('100%').padding(10).backgroundColor('#F5F5F5').borderRadius(5)
      }.width('100%').height('350')
      Text('预期：监听UIAbility级别的页面生命周期').fontSize(12).fontColor(Color.Green)
    }.width('100%').height('100%').padding(20)
  }
}

