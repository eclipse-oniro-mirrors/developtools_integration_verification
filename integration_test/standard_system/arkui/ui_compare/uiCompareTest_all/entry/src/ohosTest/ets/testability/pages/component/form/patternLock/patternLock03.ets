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

import { Router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct PatternLock03 {
  @State passwords: Number[] = []
  @State message: string = 'please input password!'
  router: Router = this.getUIContext().getRouter();
  private patternLockController1: PatternLockController = new PatternLockController()
  private patternLockController2: PatternLockController = new PatternLockController()
  private patternLockController3: PatternLockController = new PatternLockController()
  private patternLockController4: PatternLockController = new PatternLockController()
  private patternLockController5: PatternLockController = new PatternLockController()

  async routePush(targetUrl:string) {
    this.router.pushUrl({
      url: targetUrl
    })
      .then(() => {
        console.info('succeeded');
      })
      .catch((error: BusinessError) => {
        console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
      })
  }

  build() {
    Column() {
      Text(this.message)
        .textAlign(TextAlign.Center)
        .margin(10)
        .fontSize(20)

      Row() {
        Column() {
          Text('1')
            .textAlign(TextAlign.Center)
            .margin(10)
            .fontSize(20)
          PatternLock(this.patternLockController1)
            .sideLength(100)
            .circleRadius(9)
            .pathStrokeWidth(18)
            .activeColor('#B0C4DE')
            .selectedColor('#228B22')
            .pathColor('#90EE90')
            .backgroundColor(1)
            .autoReset(true)
            .onDotConnect((index: number) => {
              console.log('onDotConnect index: ' + index)
            })
        }.width('40%')
        .margin({right:'5%'})

        Column() {
          Text('0')
            .textAlign(TextAlign.Center)
            .margin(10)
            .fontSize(20)
          PatternLock(this.patternLockController2)
            .sideLength(100)
            .circleRadius(9)
            .pathStrokeWidth(18)
            .activeColor('#B0C4DE')
            .selectedColor('#228B22')
            .pathColor('#90EE90')
            .backgroundColor(0)
            .autoReset(true)
            .onDotConnect((index: number) => {
              console.log('onDotConnect index: ' + index)
            })
        }.width('40%')
      }

      Row() {
        Column() {
          Text('-1')
            .textAlign(TextAlign.Center)
            .margin(10)
            .fontSize(20)
          PatternLock(this.patternLockController3)
            .sideLength(100)
            .circleRadius(9)
            .pathStrokeWidth(18)
            .activeColor('#B0C4DE')
            .selectedColor('#228B22')
            .pathColor('#90EE90')
            .backgroundColor(-1)
            .autoReset(true)
            .onDotConnect((index: number) => {
              console.log('onDotConnect index: ' + index)
            })
        }.width('40%')
        .margin({right:'5%'})

        Column() {
          Text('100')
            .textAlign(TextAlign.Center)
            .margin(10)
            .fontSize(20)
          PatternLock(this.patternLockController4)
            .sideLength(100)
            .circleRadius(9)
            .pathStrokeWidth(18)
            .activeColor('#B0C4DE')
            .selectedColor('#228B22')
            .pathColor('#90EE90')
            .backgroundColor(100)
            .autoReset(true)
            .onDotConnect((index: number) => {
              console.log('onDotConnect index: ' + index)
            })
        }.width('40%')
      }
      Row() {
        Column() {
          Button('Push undefined')
            .margin({top:30})
            .height(40)
            .id('PatternLock03_01')
            .onClick(()=>{
              this.routePush('testability/pages/component/form/patternLock/backgroundColor01')
            })
        }
        .width('40%')
        .margin({right:'5%'})
      }

      Column() {
        Text('空字符串')
          .textAlign(TextAlign.Center)
          .margin(10)
          .fontSize(20)
        PatternLock(this.patternLockController5)
          .sideLength(100)
          .circleRadius(9)
          .pathStrokeWidth(18)
          .activeColor('#B0C4DE')
          .selectedColor('#228B22')
          .pathColor('#90EE90')
          .backgroundColor('')
          .autoReset(true)
          .onDotConnect((index: number) => {
            console.log('onDotConnect index: ' + index)
          })
      }

      Button('Reset PatternLock').margin(30).onClick(() => {
        // 重置密码锁
        this.patternLockController1.reset()
        this.patternLockController2.reset()
        this.patternLockController3.reset()
        this.patternLockController4.reset()
        this.patternLockController5.reset()
        this.passwords = []
        this.message = 'Please input password'
      })
    }.width('100%').height('100%')
  }
}
