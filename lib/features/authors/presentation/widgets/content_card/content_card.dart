import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';
import 'package:testapp/features/authors/presentation/widgets/content_card/widgets/left_arc_container.dart';

class ContentCard extends StatefulWidget {
  const ContentCard({
    Key key,
    @required this.image,
    @required this.description,
    this.name = const SizedBox(),
    this.height = 136.0,
    this.elevation = 10.0,
    this.borderRadius = 14.0,
    this.semanticContainer = false,
    this.likedByUser = false,
    this.onLikePressed,
  })  : assert(image != null),
        super(key: key);

  final Widget name;
  final String description;
  final DecorationImage image;
  final double height;
  final double elevation;
  final double borderRadius;
  final bool semanticContainer;
  final bool likedByUser;
  final ValueChanged<bool> onLikePressed;

  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool _isLikedByUser;

  @override
  void initState() {
    _isLikedByUser = widget.likedByUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: widget.semanticContainer,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      elevation: widget.elevation,
      child: SizedBox(
        height: widget.height,
        child: Stack(
          children: <Widget>[
            _buildImage(context),
            _buildNameAndDesc(context),
            if(widget.onLikePressed != null)
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: _isLikedByUser
                      ? const Icon(
                          Icons.favorite,
                          color: CustomColors.whiteColor,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: CustomColors.whiteColor,
                        ),
                  onPressed: _onLikeButtonPressed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLikeButtonPressed() {
    setState(() => _isLikedByUser = !_isLikedByUser);

    if (widget.onLikePressed != null) {
      widget.onLikePressed(_isLikedByUser);
    }
  }

  Widget _buildImage(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.centerRight,
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: LeftArcContainer(
            child: Container(
              decoration: BoxDecoration(
                image: widget.image,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameAndDesc(BuildContext context) {
    return Positioned.fill(
      left: 16.0,
      top: 41.0,
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: CustomColors.darkText,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                child: widget.name,
              ),
              DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: CustomColors.darkText,
                      fontSize: 13.0,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                child: Text(widget.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
