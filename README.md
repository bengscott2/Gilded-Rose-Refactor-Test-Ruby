# Guilded Rose Ruby

This is my approach to the Gilded Rose Kata in Ruby. I cloned from this repo and you can see the original README here.

### Approach
I thought about how I wanted to approach this refactor and came up with two ways. One is I could just delete the original code and rewrite entirely or try to break it apart bit by bit. The former seemed like it was missing the point of the exercise and so I went with taking it apart bit by bit. Then I started to plan out where I would start and how I would go about this before I touched any of the code. This is what I came up with:
- Understand the purpose
- Look at each Class
	- What behaviour does it have
	- What state does it hold
- Model it out and make sure you understand how it interacts
- If the program is running as it should write tests. Write tests so that you will know right away if you’ve gone awry. That means testing every possible outcome
- Once I felt I had a good grasp of what was happening I started to put in comments everywhere
- This gives me visual cues of where and when things happen 
- Start to look for obvious redundancies.
  - Easy to spot things that are written more than once
- Look for places where you could use guard clauses in to eliminate the need to keep checking for that situation
- Start extracting logic that is used more than once to dry up the code
- Further extract logic to have better separation of concerns.
- Reorganise file structure
- At this point I felt the code was much better organised and I can start to look at how the code is implemented and see if I can optimise to make it more easily expandable.
