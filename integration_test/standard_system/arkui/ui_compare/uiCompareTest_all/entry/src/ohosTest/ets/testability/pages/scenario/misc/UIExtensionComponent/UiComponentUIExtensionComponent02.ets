/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { ComponentContent } from '@kit.ArkUI';
class Params {
}
@Builder
function loadingBuilder(params: Params) {
  Column() {
    LoadingProgress()
      .color(Color.Blue)
  }
}
@Builder
function areaChangePlaceholderBuilder(params: Params) {
  Column() {
  }
  .width('100%')
  .height('100%')
  .backgroundColor(Color.Orange)
}
@Entry
@Component
struct UiComponentUIExtensionComponent02 {
  @State message1: string = 'Hello World 1'
  @State message2: string = 'Hello World 2'
  @State message3: string = 'Hello World 3'
  @State visible: Visibility = Visibility.Hidden
  @State wid: number = 300
  @State hei: number = 300
  private proxy: UIExtensionProxy | null = null;
  private initPlaceholder = new ComponentContent(this.getUIContext(), wrapBuilder(loadingBuilder), new Params);
  private areaChangePlaceholder = new ComponentContent(this.getUIContext(), wrapBuilder(areaChangePlaceholderBuilder), new Params);


  build() {
    Row() {
      Column() {
        Text(this.message3).fontSize(30)
        UIExtensionComponent({
          bundleName : 'com.example.1',
          abilityName: 'UIExtensionProvider',
          parameters: {
            'ability.want.params.uiExtensionType': 'sys/commonUI'
          }},
          {
            placeholder: this.initPlaceholder,
            areaChangePlaceholder: {
              'FOLD_TO_EXPAND' : this.areaChangePlaceholder,
            }
          })
          .width(this.wid)
          .height(this.hei)
          .border({width: 5, color: Color.Blue})
          .onReceive((data) => {
            console.info('Lee onReceive, for test')
            this.message3 = JSON.stringify(data['data'])
          })
          .onTerminated((info) => {
            console.info('onTerminated: code =' + info.code + ', want = ' + JSON.stringify(info.want));
          })
          .onRemoteReady((proxy) => {
            console.info('onRemoteReady, for test')
            this.proxy = proxy

            this.proxy.on('syncReceiverRegister', syncRegisterCallback1);

            this.proxy.on('asyncReceiverRegister', (proxy1) => {
              console.info('on invoke for test, type is asyncReceiverRegister');
            });
          })
          .onError((error) => {
            console.info('onError, for test')
            this.message3 = JSON.stringify(error)
          })

        Button('点击向UIExtensionAbility发送数据').onClick(() => {
          if (this.proxy != undefined) {
            this.proxy.send({data: '你好1'})

            try {
              let re = this.proxy.sendSync({data: '你好2'})
              console.info('for test, re=' + JSON.stringify(re));
            } catch (err) {
              console.error(`sendSync failed for test. errCode=${err.code}, msg=${err.message}`);
            }
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

function syncRegisterCallback1(proxy: UIExtensionProxy) {
  console.info('on invoke for test, syncRegisterCallback1, type is syncReceiverRegister');
}

function syncRegisterCallback2(proxy: UIExtensionProxy) {
  console.info('on invoke for test, syncRegisterCallback2, type is syncReceiverRegister');
}

