module View exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class, style)
import Models exposing (Model, DisplayMode(..))
import Msgs exposing (Msg)
import Page.Home
import Page.Members
import Page.Activity
import Page.SubCouncil
import Page.Feedback
import Page.Edit

view : Model -> Html Msg
view model =
    case model.display of
        ViewMode ->
            div [ style [("min-width", "700px")] ]
                [ page ViewMode model ]
        EditMode ->
            div []
                [ div [ class "fixed top-0 left-0 overflow-auto", style [("width", "calc(100% - 450px)"), ("height", "100%")] ] 
                    [ notificationBox (model.edit.alert)
                    , page EditMode model ]
                , div [ class "fixed top-0 right-0 overflow-auto", style [("width", "450px"), ("height", "100%")] ]
                    [ editor model ] ]


notificationBox alert =
    div [ class "fixed p2 m2 overflow-auto black bg-yellow", style [("max-height", "100px"), ("max-width", "600px")] ] 
        [ div [ class "bold h5 caps" ] [ text "Notification box" ]
        , div [ class "mt1" ] [ text alert ] ]

page : DisplayMode -> Model -> Html Msg
page mode model =
    case model.route of
        Models.HomeRoute ->
            Page.Home.view mode model.footer model.home

        Models.MembersRoute ->
            Page.Members.view mode model.footer model.members

        Models.ActivityRoute activity ->
            Page.Activity.view mode activity model.footer model.activities

        Models.SubCouncilRoute council ->
            Page.SubCouncil.view mode council model.footer model.council

        Models.FeedbackRoute ->
            Page.Feedback.view mode model.footer model.feedback

        Models.StartEditSession token ->
            Page.Home.view mode model.footer model.home

        Models.NotFoundRoute ->
            notFoundView


editor : Model -> Html Msg
editor model =
    Page.Edit.view model


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
