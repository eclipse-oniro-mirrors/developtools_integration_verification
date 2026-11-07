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

import { Animator as animator, AnimatorResult, SimpleAnimatorOptions } from '@kit.ArkUI';

@Entry
@Component
struct AnimatorTest01 {
  private TAG: string = '[AnimatorTest]'
  private backAnimator: AnimatorResult | undefined = undefined;
  private flag: boolean = false;
  @State wid: number = 100;
  @State hei: number = 100;
  @State optionIndex:number = 0;

  public options: SimpleAnimatorOptions[] = [
    new SimpleAnimatorOptions(100, 200).duration(1000).easing('ease').delay(0),
    new SimpleAnimatorOptions(100, 200).duration(1000).easing('ease').fill(FillMode.Forwards),
    new SimpleAnimatorOptions(100, 200).duration(1000).easing('ease').direction(PlayMode.Normal),
    new SimpleAnimatorOptions(100, 200).duration(1000).easing('ease').iterations(1),
    new SimpleAnimatorOptions(100, 200).duration(1000).delay(0).fill(FillMode.Forwards),
    new SimpleAnimatorOptions(100, 200).duration(1000).delay(0).direction(PlayMode.Normal),
    new SimpleAnimatorOptions(100, 200).duration(1000).delay(0).iterations(1),
    new SimpleAnimatorOptions(100, 200).duration(1000).fill(FillMode.Forwards).direction(PlayMode.Normal),
    new SimpleAnimatorOptions(100, 200).duration(1000).fill(FillMode.Forwards).iterations(1),
    new SimpleAnimatorOptions(100, 200).duration(1000).direction(PlayMode.Normal).iterations(1),
  ]
  create(index:number) {
    let options: SimpleAnimatorOptions = this.options[index]
    this.backAnimator = animator.create(options);
    this.backAnimator.onFinish = () => {
      this.flag = true
      console.info(this.TAG, 'backAnimator onfinish')
    }
    this.backAnimator.onRepeat = () => {
      console.info(this.TAG, 'backAnimator repeat')
    }
    this.backAnimator.onCancel = () => {
      console.info(this.TAG, 'backAnimator cancel')
    }
    this.backAnimator.onFrame = (value: number) => {
      this.wid = value
      this.hei = value
    }
  }

  aboutToDisappear() {
    // 由于backAnimator在onframe中引用了this, this中保存了backAnimator，
    // 在自定义组件消失时应该将保存在组件中的backAnimator置空，避免内存泄漏
    this.backAnimator = undefined;
  }

  build() {
    Column() {
      Column() {
        Column()
          .width(this.wid)
          .height(this.hei)
          .backgroundColor(Color.Red)
      }
      .width('100%')
      .height('24.59%')

      Column() {
        Row() {
          Button('create')
            .id('create04')
            .fontSize(30)
            .fontColor(Color.Black)
            .onClick(() => {
              this.create(this.optionIndex)
              this.optionIndex++
            })
        }
        .padding(10)

        Row() {
          Button('play')
            .id('play04')
            .fontSize(30)
            .fontColor(Color.Black)
            .onClick(() => {
              this.flag = false
              if (this.backAnimator) {
                this.backAnimator.play()
              }
            })
        }
        .padding(10)

        Row() {
          Button('pause')
            .fontSize(30)
            .fontColor(Color.Black)
            .onClick(() => {
              if (this.backAnimator) {
                this.backAnimator.pause()
              }
            })
        }
        .padding(10)

        Row() {
          Button('finish')
            .fontSize(30)
            .fontColor(Color.Black)
            .onClick(() => {
              this.flag = true
              if (this.backAnimator) {
                this.backAnimator.finish()
              }
            })
        }
        .padding(10)

        Row() {
          Button('reverse')
            .fontSize(30)
            .fontColor(Color.Black)
            .onClick(() => {
              this.flag = false
              if (this.backAnimator) {
                this.backAnimator.reverse()
              }
            })
        }
        .padding(10)

        Row() {
          Button('cancel')
            .fontSize(30)
            .fontColor(Color.Black)
            .onClick(() => {
              if (this.backAnimator) {
                this.backAnimator.cancel()
              }
            })
        }
        .padding(10)

        Row() {
          Button('reset')
            .fontSize(30)
            .fontColor(Color.Black)
            .onClick(() => {
              if (this.flag) {
                this.flag = false
                if (this.backAnimator) {
                  this.backAnimator.reset({
                    duration: 3000,
                    easing: 'ease-in',
                    delay: 0,
                    fill: 'forwards',
                    direction: 'alternate',
                    iterations: 3,
                    begin: 100,
                    end: 300
                  })
                }
              } else {
                console.info(this.TAG, 'Animation not ended')
              }
            })
        }
        .padding(10)
      }
    }
  }
}
