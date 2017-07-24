Quiz 2: Idea Factory app
******************
*****SAMPLE USERS*****
Harry Potter, email: hp@griffindor.org, password: 12345
Hermione Granger, email: hermi@griffindor.org, password: 12345
**********************


Part 1: CRUD - 30%
Implement a CRUD for ideas (not fully shown in the wireframe above). Each ideas has a title and a description.
Make sure that there are 6 specs added:
2 for new action
4 for the create action

Part 2: User Authentication - 30%
Implement basic user authentication:
user signup
user sign in
user sign out
Associate the created idea with the signed in user
Allow only the creator to edit / delete their ideas

Part 3: Reviews - 30%
Implement the ability for users to put reviews on each idea's show page
User must be signed in in order to create a review and the created ideas get associated with the signed in user
The user who created the review should be able to delete the review

Part 4: Interactivity - 10%
Instead of showing the idea and description as in the wireframe, have the description be hidden at the start and then when you click the title it slides out the description. Clicking the title again should slide in the idea.
Make clicking New Idea open a modal (you can use Bootstrap Modal if you'd like) instead of taking you to a new page.

Part 5 (BONUS): Liking - 10%
Implement the ability for users to like an idea, liking an idea will just increment a counter on the idea
Prevent the user from liking an idea a second time using cookies or sessions (ssssssh, don't tell users that's what we're doing)

***********
Notes:
You can ignore the join functionality for now
You can use any technology you want to implement the above (e.g. Rails or Express.js, with CanCanCan or without).
Create a Github repo containing your quiz solution.
Send the Github repo link to a TA buddy and ask him/her to mark it when they are at CodeCore.
If you haven't used jQuery with Rails before: remember jQuery is automatically included with Rails and you can just put it any js in app/assets/javascripts
