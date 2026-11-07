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

/**
 * router.pushUrl含mode同步接口稳定性测试
 * SUB_ACE_Routing_NAMEDROUTES_DFX_0020
 */
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@ComponentV2
export struct RoutingNamedroutesDfx0020 {
  @Local logs: string[] = [];
  @Local testCount: number = 0;

  addLog(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.logs.unshift(`[${timestamp}] ${msg}`);
    if (this.logs.length > 50) {
      this.logs = this.logs.slice(0, 50);
    }
  }

  pushUrlWithModeSync(): void {
    this.testCount++;
    this.addLog(`第 ${this.testCount} 次调用 pushUrlWithModeSync`);
    try {
      router.pushUrl({ url: 'testability/pages/scenario/ability_router/RoutingNamedroutesDfx/RoutingNamedroutesDfx21',
          params: { source: 'SUB_ACE_Routing_NAMEDROUTES_DFX_0020' }
         });
      this.addLog('✅ API调用完成');
    } catch (err) {
      this.addLog(`❌ 调用失败: ${JSON.stringify(err)}`);
    }
  }

  stabilityTest(): void {
    this.addLog('🔄 开始稳定性测试 (连续调用100次)...');
    for (let i = 0; i < 100; i++) {
      setTimeout(() => {
        this.pushUrlWithModeSync();
      }, i * 10);
    }
  }

  build() {
    Column() {
      Text('router.pushUrl含mode同步接口稳定性测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('SUB_ACE_Routing_NAMEDROUTES_DFX_0020')
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 20 })

      Button('稳定性测试-pushUrl(mode同步)')
        .width('90%')
        .onClick(() => {
          this.pushUrlWithModeSync();
        })
        .margin({ bottom: 10 })
        .id('btn')

      Button('稳定性测试(100次)')
        .width('90%')
        .onClick(() => {
          this.stabilityTest();
        })
        .margin({ bottom: 10 })
        .backgroundColor('#FF6B35')

      Button('清空日志')
        .width('90%')
        .onClick(() => {
          this.logs = [];
          this.testCount = 0;
        })
        .margin({ bottom: 10 })
        .backgroundColor('#4ECDC4')

      Text(`日志 (共${this.logs.length}条):`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      List() {
        ForEach(this.logs, (log: string, index: number) => {
          ListItem() {
            Text(log)
              .fontSize(12)
              .padding(8)
              .width('100%')
              .backgroundColor(index % 2 === 0 ? '#f5f5f5' : '#ffffff')
          }
        })
      }
      .width('95%')
      .height('40%')
      .border({ width: 1, color: '#ddd' })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
