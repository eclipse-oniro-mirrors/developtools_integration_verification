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
struct UiAbilityPage111 {
  @State message: string = 'PageTwo';
  @State operationLog: string = '';

  aboutToAppear(): void { this.addLog('PageTwo aboutToAppear'); }
  onPageShow(): void { this.addLog('PageTwo OnPageShow'); }

  addLog(msg: string): void {
    this.operationLog = `[${new Date().toLocaleTimeString()}] ${msg}\n${this.operationLog}`;
  }

  pushNavDestination(): void {
    this.addLog('push到 NavDestinationA (不会触发监听)');
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message).fontSize(24).fontWeight(FontWeight.Bold)
      Button('push->NavDestinationA').onClick(() => this.pushNavDestination()).width('80%').backgroundColor('#E6A23C')
      Button('返回').onClick(() => router.back()).width('80%')
      Scroll() {
        Text(this.operationLog).fontSize(12).width('100%').padding(10).backgroundColor('#F5F5F5').borderRadius(5)
      }.width('100%').height('400')
    }.width('100%').height('100%').padding(20)
  }
}

