import 'package:eval/shared/constants.dart';
import 'package:eval/shared/icon_broken.dart';
import 'package:eval/views/widgets/main_button.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leading: InkWell(child: const Icon(IconBroken.Arrow___Left, color: Colors.black), onTap: (){
          Navigator.of(context).pop();
        },
      ),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Constants.defaultPadding),
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          children: [
                            Container(
                              height: 170,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://wallpaperaccess.com/full/2576098.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withAlpha(150),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0)),
                                    )),
                                OutlinedButton(
                                    onPressed: () {},
                                    child: SizedBox(
                                      width: 110,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Edit cover photo',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          const Icon(
                                            IconBroken.Camera,
                                            size: 19,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 64.0,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: Stack(
                          alignment: Alignment.center,
                          children:  [
                             const CircleAvatar(
                              radius: 60.0,
                              backgroundImage: NetworkImage(
                                  'https://wallpaperaccess.com/full/3037916.png'),
                            ),
                            CircleAvatar(
                              radius: 60.0,
                              backgroundColor: Colors.black.withAlpha(150),
                            ),
                            SizedBox(
                              height: 36,
                              child: OutlinedButton(onPressed: (){}, 
                                child: Column(
                                  children:  [
                                    Text('Add Photo',
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const Icon(IconBroken.Camera, size: 19, color: Colors.white,)
                                  ],
                                ),
                              
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: Constants.defaultPadding,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Name')
                  ),
                ),
                const SizedBox(
                  height: Constants.defaultPadding/2,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Bio')
                  ),
                ),
                const SizedBox(
                  height: Constants.defaultPadding/2,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Phone')
                  ),
                ),
                const SizedBox(
                  height: Constants.defaultPadding/2,
                ),
                MainButton(text: 'Submit', onTap: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
