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
import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'Routerpage029B';

@Entry
@ComponentV2
export struct Routerpage029B {
  @Local receivedParams: string = '';
  @Local counter: number = 0;

  build() {
    Column({ space: 15 }) {
      Text(`页面B - 参数更新测试`)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider()

      Text(`接收到的参数：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Text(this.receivedParams || '暂无参数')
        .fontSize(12)
        .fontColor(this.receivedParams ? Color.Green : Color.Gray)
        .padding(10)
        .backgroundColor('#F0F0F0')
        .borderRadius(4)
        .width('90%')

      Text(`计数器：${this.counter}`)
        .fontSize(12)
        .fontColor(Color.Blue)

      Divider()

      Button(`跳转回A页面\n传递参数：counter=${this.counter}`)
        .id('btn_to_a')
        .width('90%')
        .onClick(async () => {
          try {
            await router.pushUrl({
              url: 'testability/pages/scenario/ability_router/BasicabilityRouterpage/Routerpage029A',
              params: {
                from: 'B',
                counter: this.counter,
                timestamp: Date.now()
              }
            });
            hilog.info(0x0000, TAG, `Pushed to A with counter=${this.counter}`);
          } catch (error) {
            hilog.error(0x0000, TAG, `Push error: ${JSON.stringify(error)}`);
          }
        })

      Button('增加计数器')
        .id('btn_inc')
        .width('90%')
        .backgroundColor(Color.Orange)
        .onClick(() => {
          this.counter++;
        })

      Button('返回')
        .id('btn_back')
        .width('90%')
        .backgroundColor(Color.Gray)
        .onClick(() => {
          router.back();
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#FFF3E0')
  }

  aboutToAppear(): void {
    const params = router.getParams() as Record<string, Object>;
    if (params) {
      this.receivedParams = JSON.stringify(params, null, 2);
      if (params['counter'] !== undefined) {
        this.counter = params['counter'] as number;
      }
      hilog.info(0x0000, TAG, `Received params: ${this.receivedParams}`);
    }
  }
}

